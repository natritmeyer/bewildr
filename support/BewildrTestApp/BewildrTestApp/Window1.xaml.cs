using System.Threading;
using System.Windows;
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

            //set three state checkbox to be intermediate
            three_state_checkbox.IsChecked = null;
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

        private void tree_l1_double_clicked(object sender, RoutedEventArgs e)
        {
            tree_results.Content = "level 1 double clicked";
        }

        private void tree_l2_double_clicked(object sender, RoutedEventArgs e)
        {
            tree_results.Content = "level 2 double clicked";
        }

        private void tree_l3_double_clicked(object sender, RoutedEventArgs e)
        {
            tree_results.Content = "level 3 double clicked";
        }

        private void tree_l1_selected(object sender, RoutedEventArgs e)
        {
            tree_results.Content = "level 1 selected";
        }

        private void tree_l2_selected(object sender, RoutedEventArgs e)
        {
            tree_results.Content = "level 2 selected";
        }

        private void tree_l3_selected(object sender, RoutedEventArgs e)
        {
            tree_results.Content = "level 3 selected";
        }
    }
}
