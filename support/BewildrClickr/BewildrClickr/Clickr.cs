//Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

using System;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.Windows;
using System.Security.Permissions;
using System.Security;

namespace Bewildr.Clickr
{
    public class Clickr
    {
        #region constants

        internal const int InputMouse = 0;
        internal const int MouseeventfVirtualdesk = 0x4000;

        internal const int SMXvirtualscreen = 76;
        internal const int SMYvirtualscreen = 77;
        internal const int SMCxvirtualscreen = 78;
        internal const int SMCyvirtualscreen = 79;

        #endregion

        #region public methods called by ironruby

        public void Click(Point location)
        {
            SetLocation(location);
            LeftMouseButtonDown();
            LeftMouseButtonUp();
        }
        public void RightClick(Point location)
        {
            SetLocation(location);
            RightMouseButtonDown();
            RightMouseButtonUp();
        }

        public void DoubleClick(Point location)
        {
            SetLocation(location);
            LeftMouseButtonDown();
            LeftMouseButtonUp();
            LeftMouseButtonDown();
            LeftMouseButtonUp();
        }

        #endregion

        #region high level mouse actions

        protected void SetLocation(Point location)
        {
            //Point point = new Point(location.X, location.Y);
            PerformMouseAction((int)location.X, (int)location.Y, 0, MouseInputFlags.Move | MouseInputFlags.Absolute);
        }

        protected void LeftMouseButtonDown()
        {
            PerformMouseAction(0, 0, 0, MouseInputFlags.LeftDown);
        }

        protected void LeftMouseButtonUp()
        {
            PerformMouseAction(0, 0, 0, MouseInputFlags.LeftUp);
        }

        protected void RightMouseButtonDown()
        {
            PerformMouseAction(0, 0, 0, MouseInputFlags.RightDown);
        }

        protected void RightMouseButtonUp()
        {
            PerformMouseAction(0, 0, 0, MouseInputFlags.RightUp);
        }

        #endregion

        #region wraps the weird user32 SendInput method

        [PermissionSet(SecurityAction.Assert, Name = "FullTrust")]
        private static void PerformMouseAction(int coord_x, int coord_y, int something, MouseInputFlags flags)
        {
            PermissionSet permissions = new PermissionSet(PermissionState.Unrestricted);
            permissions.Demand();

            int intflags = (int)flags;

            if ((intflags & (int)MouseInputFlags.Absolute) != 0)
            {
                // Absolute position requires normalized coordinates.
                NormalizeCoordinates(ref coord_x, ref coord_y);
                intflags |= MouseeventfVirtualdesk;
            }

            INPUT mi = new INPUT();
            mi.type = InputMouse;
            mi.union.mouseInput.dx = coord_x;
            mi.union.mouseInput.dy = coord_y;
            mi.union.mouseInput.mouseData = something;
            mi.union.mouseInput.dwFlags = intflags;
            mi.union.mouseInput.time = 0;
            mi.union.mouseInput.dwExtraInfo = new IntPtr(0);

            if (SendInput(1, ref mi, Marshal.SizeOf(mi)) == 0)
            {
                throw new Win32Exception(Marshal.GetLastWin32Error());
            }
        }

        private static void NormalizeCoordinates(ref int x, ref int y)
        {
            int vScreenWidth = GetSystemMetrics(SMCxvirtualscreen);
            int vScreenHeight = GetSystemMetrics(SMCyvirtualscreen);
            int vScreenLeft = GetSystemMetrics(SMXvirtualscreen);
            int vScreenTop = GetSystemMetrics(SMYvirtualscreen);
            x = ((x - vScreenLeft) * 65536) / vScreenWidth + 65536 / (vScreenWidth * 2);
            y = ((y - vScreenTop) * 65536) / vScreenHeight + 65536 / (vScreenHeight * 2);
        }

        #endregion

        #region weird user32 clicking stuff - remind me why I code in ruby again?

        [DllImport("user32.dll", SetLastError = true)]
        internal static extern int SendInput(int nInputs, ref INPUT mi, int cbSize);

        [DllImport("user32.dll", ExactSpelling = true, CharSet = CharSet.Auto)]
        internal static extern int GetSystemMetrics(int nIndex);

        [StructLayout(LayoutKind.Sequential)]
        internal struct INPUT
        {
            internal int type;
            internal INPUTUNION union;
        };

        [StructLayout(LayoutKind.Explicit)]
        internal struct INPUTUNION
        {
            [FieldOffset(0)]
            internal MOUSEINPUT mouseInput;
            [FieldOffset(0)]
            internal KEYBDINPUT keyboardInput;
        };

        [StructLayout(LayoutKind.Sequential)]
        internal struct MOUSEINPUT
        {
            internal int dx;
            internal int dy;
            internal int mouseData;
            internal int dwFlags;
            internal int time;
            internal IntPtr dwExtraInfo;
        };

        [StructLayout(LayoutKind.Sequential)]
        internal struct KEYBDINPUT
        {
            internal short wVk;
            internal short wScan;
            internal int dwFlags;
            internal int time;
            internal IntPtr dwExtraInfo;
        };

        internal enum MouseInputFlags
        {
            Move = 0x0001,
            LeftDown = 0x0002,
            LeftUp = 0x0004,
            RightDown = 0x0008,
            RightUp = 0x0010,
            MiddleDown = 0x0020,
            MiddleUp = 0x0040,
            XDown = 0x0080,
            XUp = 0x0100,
            Wheel = 0x0800,
            Absolute = 0x8000,
        };

        #endregion
    }
}