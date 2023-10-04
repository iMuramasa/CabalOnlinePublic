 
/**/         private bool isTheme1 = true; // Флаг для отслеживания текущего состояния темы
/**/         private bool isTheme2 = false;
/**/         private bool isTheme3 = false;
/**/         private readonly string settingsFilePath = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "config\\settings.xml");

s//--------------------------------------------------------------------смена юай в лаунчере--------------------------------------------------------------------------------\\
 /*UI*/      private void btn_change_Click(object sender, RoutedEventArgs e)
 /*UI*/    {
 /*UI*/        var menu = new ContextMenu();
 /*UI*/
 /*UI*/        var theme1MenuItem = new MenuItem();
 /*UI*/        theme1MenuItem.Header = "theme1";
 /*UI*/        theme1MenuItem.Click += Theme1MenuItem_Click;
 /*UI*/        menu.Items.Add(theme1MenuItem);
 /*UI*/
 /*UI*/        var theme2MenuItem = new MenuItem();
 /*UI*/        theme2MenuItem.Header = "theme2";
 /*UI*/        theme2MenuItem.Click += Theme2MenuItem_Click;
 /*UI*/        menu.Items.Add(theme2MenuItem);
 /*UI*/
 /*UI*/        var theme3MenuItem = new MenuItem();
 /*UI*/        theme3MenuItem.Header = "theme3";
 /*UI*/        theme3MenuItem.Click += Theme3MenuItem_Click;
 /*UI*/        menu.Items.Add(theme3MenuItem);
 /*UI*/
 /*UI*/        menu.PlacementTarget = btn_change;
 /*UI*/        menu.IsOpen = true;
 /*UI*/
 /*UI*/        if (!File.Exists("Data\\ui.dat"))
 /*UI*/        {
 /*UI*/            MessageBox.Show("Файл ui.dat не найден. Приложение будет закрыто.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
 /*UI*/
 /*UI*/            // Запись ошибки в файл лога
 /*UI*/            using (StreamWriter writer = new StreamWriter(logFilePath, true))
 /*UI*/            {
 /*UI*/                writer.WriteLine("Файл ui.dat не найден.");
 /*UI*/            }
 /*UI*/
 /*UI*/            // Завершение приложения
 /*UI*/            Environment.Exit(1);
 /*UI*/        }
 /*UI*/    }
 /*UI*/    private void UpdateTheme()
 /*UI*/    {
 /*UI*/        string themeText = "";
 /*UI*/
 /*UI*/        if (isTheme1)
 /*UI*/        {
 /*UI*/            themeText = "Thema1";
 /*UI*/            // Дополнительный код для изменения внешнего вида элементов в соответствии с темой 1
 /*UI*/        }
 /*UI*/        else if (isTheme2)
 /*UI*/        {
 /*UI*/            themeText = "Thema2";
 /*UI*/            // Дополнительный код для изменения внешнего вида элементов в соответствии с темой 2
 /*UI*/        }
 /*UI*/        else if (isTheme3)
 /*UI*/        {
 /*UI*/            themeText = "Thema3";
 /*UI*/            // Дополнительный код для изменения внешнего вида элементов в соответствии с темой 3
 /*UI*/        }
 /*UI*/
 /*UI*/        btn_change.Content = themeText;
 /*UI*/    }
 /*UI*/
 /*UI*/    private void Theme1MenuItem_Click(object sender, RoutedEventArgs e)
 /*UI*/    {
 /*UI*/        if (!isTheme1)
 /*UI*/        {
 /*UI*/            isTheme1 = true;
 /*UI*/            isTheme2 = false;
 /*UI*/            isTheme3 = false;
 /*UI*/            SaveSettings();
 /*UI*/            UpdateTheme();
 /*UI*/            UpdateUIDatFile();
 /*UI*/            ShowThemeChangeNotification();
 /*UI*/        }
 /*UI*/    }
 /*UI*/
 /*UI*/    private void Theme2MenuItem_Click(object sender, RoutedEventArgs e)
 /*UI*/    {
 /*UI*/        if (!isTheme2)
 /*UI*/        {
 /*UI*/            isTheme1 = false;
 /*UI*/            isTheme2 = true;
 /*UI*/            isTheme3 = false;
 /*UI*/            SaveSettings();
 /*UI*/            UpdateTheme();
 /*UI*/            UpdateUIDatFile();
 /*UI*/            ShowThemeChangeNotification();
 /*UI*/        }
 /*UI*/    }
 /*UI*/
 /*UI*/    private void Theme3MenuItem_Click(object sender, RoutedEventArgs e)
 /*UI*/    {
 /*UI*/        if (!isTheme3)
 /*UI*/        {
 /*UI*/            isTheme1 = false;
 /*UI*/            isTheme2 = false;
 /*UI*/            isTheme3 = true;
 /*UI*/            SaveSettings();
 /*UI*/            UpdateTheme();
 /*UI*/            UpdateUIDatFile();
 /*UI*/            ShowThemeChangeNotification();
 /*UI*/        }
 /*UI*/    }
 /*UI*/
 /*UI*/
 /*UI*/private void ShowThemeChangeNotification()
 /*UI*/    {
 /*UI*/        MessageBox.Show("Тема успешно изменена.", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
 /*UI*/    }
 /*UI*/    private void UpdateUIDatFile()
 /*UI*/    {
 /*UI*/        try
 /*UI*/        {
 /*UI*/            string filePath = "Data\\ui.dat";
 /*UI*/            string searchString = "";
 /*UI*/            string replaceString = "";
 /*UI*/
 /*UI*/            if (isTheme1)
 /*UI*/            {
 /*UI*/                searchString = "theme2|theme3";
 /*UI*/                replaceString = "theme1";
 /*UI*/            }
 /*UI*/            else if (isTheme2)
 /*UI*/            {
 /*UI*/                searchString = "theme1|theme3";
 /*UI*/                replaceString = "theme2";
 /*UI*/            }
 /*UI*/            else if (isTheme3)
 /*UI*/            {
 /*UI*/                searchString = "theme1|theme2";
 /*UI*/                replaceString = "theme3";
 /*UI*/            }
 /*UI*/            else
 /*UI*/            {
 /*UI*/                // По умолчанию выбрана тема 1
 /*UI*/                searchString = "theme2";
 /*UI*/                replaceString = "theme1";
 /*UI*/            }
 /*UI*/
 /*UI*/            // Открыть файл для чтения и записи
 /*UI*/            using (FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.ReadWrite))
 /*UI*/            {
 /*UI*/                // Прочитать содержимое файла
 /*UI*/                byte[] bytes = new byte[fileStream.Length];
 /*UI*/                fileStream.Read(bytes, 0, bytes.Length);
 /*UI*/                string content = Encoding.Default.GetString(bytes);
 /*UI*/
 /*UI*/                // Заменить строку
 /*UI*/                content = Regex.Replace(content, searchString, replaceString);
 /*UI*/                bytes = Encoding.Default.GetBytes(content);
 /*UI*/
 /*UI*/                // Переместить указатель на начало файла и записать измененное содержимое
 /*UI*/                fileStream.Seek(0, SeekOrigin.Begin);
 /*UI*/                fileStream.Write(bytes, 0, bytes.Length);
 /*UI*/            }
 /*UI*/
 /*UI*/            Console.WriteLine("Изменения внесены.");
 /*UI*/            Console.ReadLine();
 /*UI*/        }
 /*UI*/        catch (Exception ex)
 /*UI*/        {
 /*UI*/            Console.WriteLine("Ошибка при обновлении файла ui.dat: " + ex.Message);
 /*UI*/        }
 /*UI*/    }
 /*UI*/
 /*UI*/    private void SaveSettings()
 /*UI*/    {
 /*UI*/        try
 /*UI*/        {
 /*UI*/            XDocument doc = new XDocument();
 /*UI*/            XElement root = new XElement("Settings");
 /*UI*/            XElement themeElement;
 /*UI*/            if (isTheme1)
 /*UI*/                themeElement = new XElement("Theme", "Thema1");
 /*UI*/            else if (isTheme2)
 /*UI*/                themeElement = new XElement("Theme", "Thema2");
 /*UI*/            else if (isTheme3)
 /*UI*/                themeElement = new XElement("Theme", "Thema3");
 /*UI*/            else
 /*UI*/                themeElement = new XElement("Theme", "Thema1"); // По умолчанию выбрана тема 1
 /*UI*/    
 /*UI*/            root.Add(themeElement);
 /*UI*/            doc.Add(root);
 /*UI*/            doc.Save(settingsFilePath);
 /*UI*/        }
 /*UI*/        catch (Exception ex)
 /*UI*/        {
 /*UI*/            Console.WriteLine("Ошибка при сохранении настроек: " + ex.Message);
 /*UI*/        }
 /*UI*/    }
 /*UI*/    
 /*UI*/    private void LoadSettings()
 /*UI*/    {
 /*UI*/        try
 /*UI*/        {
 /*UI*/            if (File.Exists(settingsFilePath))
 /*UI*/            {
 /*UI*/                XDocument doc = XDocument.Load(settingsFilePath);
 /*UI*/                XElement themeElement = doc.Element("Settings")?.Element("Theme");
 /*UI*/                if (themeElement != null)
 /*UI*/                {
 /*UI*/                    string theme = themeElement.Value;
 /*UI*/                    isTheme1 = (theme == "Thema1");
 /*UI*/                    isTheme2 = (theme == "Thema2");
 /*UI*/                    isTheme3 = (theme == "Thema3");
 /*UI*/                }
 /*UI*/            }
 /*UI*/        }
 /*UI*/        catch (Exception ex)
 /*UI*/        {
 /*UI*/            Console.WriteLine("Ошибка при загрузке настроек: " + ex.Message);
 /*UI*/        }
 /*UI*/        UpdateTheme();
 /*UI*/    }
 /*UI*/
 /*UI*/
  //----------------------------------------------------------------------------------------------------------------------------------------------------------------------\\
