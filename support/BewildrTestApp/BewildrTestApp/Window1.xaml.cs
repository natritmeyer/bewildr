using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Threading;

namespace BewildrTestApp
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();

            //populate the combobox
            comboBox1.Items.Add("Zero");
            comboBox1.Items.Add("One");
            comboBox1.Items.Add("Two");
            comboBox1.Items.Add("Three");
            comboBox1.Items.Add("Four");
            comboBox1.Items.Add("Five");
            comboBox1.Items.Add("Six");
            comboBox1.Items.Add("Seven");
            comboBox1.Items.Add("Eight");
            comboBox1.Items.Add("Nine");

            //populate the single select list
            single_select_list_box.Items.Add("Zero");
            single_select_list_box.Items.Add("One");
            single_select_list_box.Items.Add("Two");
            single_select_list_box.Items.Add("Three");

            //populate the multiple select list
            multiple_select_list.Items.Add("Zero");
            multiple_select_list.Items.Add("One");
            multiple_select_list.Items.Add("Two");
            multiple_select_list.Items.Add("Three");
        }

        private void enabled_button_Click(object sender, RoutedEventArgs e)
        {
            enabled_button_message.Content = "clicked!";
        }

        private void wait_for_existence_button_Click(object sender, RoutedEventArgs e)
        {
            //wait for a bit
            Thread.Sleep(1000);
            //make a new element appear
            System.Windows.Controls.Button myMagicButton = new Button();
            myMagicButton.Content = "suddenly exists";
            stackPanel1.Children.Add(myMagicButton);
        }

        private void a_link_Click(object sender, RoutedEventArgs e)
        {
            link_clicked_label.Content = "link clicked!";
        }
    }
}
