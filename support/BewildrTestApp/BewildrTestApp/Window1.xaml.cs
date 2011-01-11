using System;
using System.Collections.Generic;
using System.Threading;
using System.Windows;
using System.Data;
using System.Windows.Controls;

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

            //write any command line args to the basic tab
            command_line_args.Content = String.Join(" ", Environment.GetCommandLineArgs());

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
            single_select_list_box.Items.Add("Four");
            single_select_list_box.Items.Add("5");
            single_select_list_box.Items.Add("6");
            single_select_list_box.Items.Add("7");
            single_select_list_box.Items.Add("8");
            single_select_list_box.Items.Add("9");
            single_select_list_box.Items.Add("10");
            single_select_list_box.Items.Add("11");
            single_select_list_box.Items.Add("12");
            single_select_list_box.Items.Add("13");
            single_select_list_box.Items.Add("14");
            single_select_list_box.Items.Add("15");
            single_select_list_box.Items.Add("16");
            single_select_list_box.Items.Add("17");
            single_select_list_box.Items.Add("18");
            single_select_list_box.Items.Add("19");
            single_select_list_box.Items.Add("20");
            single_select_list_box.Items.Add("twentyone");


            //populate the multiple select list
            multiple_select_list.Items.Add("Zero");
            multiple_select_list.Items.Add("One");
            multiple_select_list.Items.Add("Two");
            multiple_select_list.Items.Add("Three");

            //set three state checkbox to be intermediate
            three_state_checkbox.IsChecked = null;

            //create the table
            DataTable data_table = new DataTable("testdata");

            //create the table columns
            DataColumn col1 = new DataColumn("col 1", typeof(string));
            DataColumn col2 = new DataColumn("col 2", typeof(string));
            DataColumn col3 = new DataColumn("col 3", typeof(string));

            //add the columns to the datatable
            data_table.Columns.Add(col1);
            data_table.Columns.Add(col2);
            data_table.Columns.Add(col3);

            //add some rows
            data_table.Rows.Add("1", "Alice", "good");
            data_table.Rows.Add("2", "Bob", "good");
            data_table.Rows.Add("3", "Eve", "bad");

            ///horrible binding stuff
            dataGrid1.DataContext = data_table;
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

        private void menuTopLevel_Click(object sender, RoutedEventArgs e)
        {
            top_level_menu_result.Content = "selected!";
        }

        private void menuSubLevel_Click(object sender, RoutedEventArgs e)
        {
            sub_level_menu_result.Content = "selected!";
        }

        private void menuSubSubLevel_Click(object sender, RoutedEventArgs e)
        {
            sub_sub_level_menu_result.Content = "selected!";
        }

        private void tree_double_clicked(object sender, RoutedEventArgs e)
        {
            tree_results.Content = ((TreeViewItem)treeView1.SelectedItem).Header + " double clicked";
        }

        private void tree_selected(object sender, RoutedEventArgs e)
        {
            tree_results.Content = ((TreeViewItem)treeView1.SelectedItem).Header + " selected";
        }

        private void label_double_clicked(object sender, RoutedEventArgs e)
        {
            double_click_result.Content = "double clicked!";
        }

        private void drag_target_DragEnter(object sender, DragEventArgs e)
        {
            drag_target.Content = "drag over registered";
        }

        private void drag_via_me_DragEnter(object sender, DragEventArgs e)
        {
            drag_via_me.Content = "via drag registered";
        }
    }
}
