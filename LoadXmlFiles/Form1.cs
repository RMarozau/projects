using AngleSharp;
using AngleSharp.Html.Parser;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using HtmlAgilityPack;
using HtmlDocument = HtmlAgilityPack.HtmlDocument;

namespace LoadXmlFiles
{
    public partial class Form1 : Form
    {
        HtmlDocument someDoc;
        public Form1()
        {
            InitializeComponent();       
        }

        private void buttonGetFile_Click(object sender, EventArgs e)
        {          

            OpenFileDialog openFileDialog = new OpenFileDialog();

            if (openFileDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                if (openFileDialog.FileName.EndsWith(".xml"))
                {
                    textBoxDirectoryFile.Text = openFileDialog.FileName;
                }
                else
                {
                    MessageBox.Show("Можно выбирать только .xml файлы!", "Предупреждение!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;

                }
                someDoc = new HtmlDocument();
                someDoc.Load(textBoxDirectoryFile.Text);
                textBox1.Text = someDoc.ParsedText;            

            }
           
        }     

        private void buttonRefresh_Click_1(object sender, EventArgs e)
        {
            if(textBoxSelector.Text.Trim() == "")
            {
                MessageBox.Show("XPath не заполнен!", "Предупреждение!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (textBoxDirectoryFile.Text.Trim() == "")
            {
                MessageBox.Show("Выбирите файл!", "Предупреждение!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            textBox1.Text = "";
            try
            {
                foreach (HtmlNode nodeRss in someDoc.DocumentNode.SelectNodes(textBoxSelector.Text))
                {
                    textBox1.Text += nodeRss.OuterHtml;
                }
            }
            catch
            {
                
                MessageBox.Show("Неверно указан XPath", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);

            }
            
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if(textBox1.Text != "")
            {
                DialogResult result = MessageBox.Show("Сохранить результат в файл?", "Инфомрация!", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result == DialogResult.Yes)
                {
                    SaveFileDialog saveFileDialog = new SaveFileDialog();
                    saveFileDialog.Filter = "Xml files(*.xml)|*.xml|All files(*.*)|*.*";
                    if (saveFileDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                    {
                        File.WriteAllText(saveFileDialog.FileName,textBox1.Text);
                    }
                }
            }

           
        }
    }

}
