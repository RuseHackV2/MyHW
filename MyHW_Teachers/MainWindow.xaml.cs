using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using System.Security.Cryptography;
using System.Net;
using System.Web;
using System.IO;

namespace MyHW_Teachers
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : MetroWindow
    {
        private Teacher atmTeacher;

        public MainWindow()
        {
            InitializeComponent ();
        }

        static string md5(string input)
        {
            // step 1, calculate MD5 hash from input
            MD5 md5 = System.Security.Cryptography.MD5.Create ();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes (input);
            byte[] hash = md5.ComputeHash (inputBytes);
            // step 2, convert byte array to hex string
            StringBuilder sb = new StringBuilder ();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append (hash[i].ToString ("x2"));
            } 
            return sb.ToString ();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            var context = new MyHWEntities();
            bool foundUser = false;
            foreach (Teacher currentTeacher in context.Teachers)
            {
                if (usernameBox.Text == currentTeacher.username && md5 (md5 (passwordBox.Password) + "8c4f4370c53e0c1e1ae9acd577dddbed") == currentTeacher.password)
                {
                    atmTeacher = currentTeacher;
                    foundUser = true;
                    break;
                }
            }
            if (!foundUser)
            {
                this.ShowMessageAsync ("Грешка", "Грешно потребителско име или парола!");
                return;
            } 

            TabItem firstTab = tabControl.Items[0] as TabItem,
                            secondTab = tabControl.Items[1] as TabItem;
            secondTab.Header = "Групи";
            firstTab.Header = "";
            secondTab.IsSelected = true;
            firstTab.IsSelected = false;

            firstName.Content = atmTeacher.firstName;
            lastName.Content = atmTeacher.lastName;

            

          
                var currentGroup = context.Groups.Where (t => (t.teacherId == atmTeacher.id)).Select(t => t.name);

            int x=0, y=0, z = 0;

            foreach (var item in currentGroup)
            {
                Tile testasd = new Tile ();
                testasd.Background = new SolidColorBrush (Color.FromArgb (0xFF, 0x41, 0xB1, 0xE1));
                Tiles.Children.Add (testasd);
                Grid.SetColumn (testasd, x);
                Grid.SetRow (testasd, y);
                testasd.Content = item;
                x++;
                if (x != 0 && x % 3 == 0)
                { y++; x = 0; }
                z++;

            }

            //var currentGroup = context.TeachersGroups.Where (t => (t.teacherId == atmTeacher.id)).Select (t => t.groupId);
            /*
            Tile test = new Tile();
            test.Background = new SolidColorBrush (Color.FromArgb (0xFF, 0x41, 0xB1, 0xE1));
            Tiles.Children.Add (test);
            Tile test2 = new Tile ();
            test2.Background = new SolidColorBrush (Color.FromArgb (0xFF, 0x41, 0xB1, 0xE1));
            Tiles.Children.Add (test2);
            Tile test3 = new Tile ();
            test3.Background = new SolidColorBrush (Color.FromArgb (0xFF, 0x41, 0xB1, 0xE1));
            Tiles.Children.Add (test3);
            Tile test4 = new Tile ();
            test4.Background = new SolidColorBrush (Color.FromArgb (0xFF, 0x41, 0xB1, 0xE1));
            Tiles.Children.Add (test4);
            //test.Margin = new Thickness(10, 10, 383, 372);
            Grid.SetColumn (test, 0);
            Grid.SetRow (test, 0);
            Grid.SetColumn (test2, 1);
            Grid.SetRow (test2, 0);
            Grid.SetColumn (test3, 2);
            Grid.SetRow (test3, 0);
            Grid.SetColumn (test4, 0);
            Grid.SetRow (test4, 1);*/
            
            //test +=
            //test.Parent = 
            /* < Controls:Tile Title = "Mail" Background = "#41B1E1" Margin = "10,10,383,372" >
                                  < Grid Width = "44"
                           Background = "{Binding Path=Foreground, RelativeSource={RelativeSource FindAncestor, AncestorType={x:Type Controls:Tile}}}" >
                                 < Grid.OpacityMask >
                                     < VisualBrush Stretch = "Fill"
                                          Visual = "{DynamicResource appbar_people_multiple}" />
                                 </ Grid.OpacityMask >
                             </ Grid >
                         </ Controls:Tile >*/

        }

        string POST(string url, string postData)
        {
            var request = (HttpWebRequest)WebRequest.Create (url);

            var data = Encoding.ASCII.GetBytes (postData);

            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = data.Length;

            using (var stream = request.GetRequestStream ())
            {
                stream.Write (data, 0, data.Length);
            }

            var response = (HttpWebResponse)request.GetResponse ();

            return new StreamReader (response.GetResponseStream ()).ReadToEnd ();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            const string COPYSCAPE_API_URL = "http://www.copyscape.com/api/";
            const string COPYSCAPE_USERNAME = "iancollins";
            const string COPYSCAPE_API_KEY = "hahcazy0ydtuu2i2";
            
            string textToCheck = "Ахил е изцяло изграден върху контраста. Често между противоречивите качества липсва всякакъв преход. Със своите бързи излитания и сривове той напомня ексцентричността на Омировите богове, които винаги преминават от едно към друго емоционално състояние.";

            string postData = "u=" + COPYSCAPE_USERNAME + "&k=" + COPYSCAPE_API_KEY + "&o=csearch&e=UTF-8&t=" + textToCheck + "&f=xml";

            System.IO.File.WriteAllText ("WriteLines.xml", POST (COPYSCAPE_API_URL, Uri.EscapeUriString (postData)));

        }
    }
}
