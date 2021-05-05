using CoreProject.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreProject.Managers
{
    public class ReceiptManager
    {
        public void CreateInvoice(ReceiptModel model)
        {
            string connectionString = "Data Source=localhost\\SQLExpress;Initial Catalog=Financials; Integrated Security=true";

            string queryString =
                $@" INSERT INTO Receipt ( ReceiptNumber, Date, Company, Amount, Revenue_Expense) 
                    VALUES ( @ReceiptNumber, @Date, @Company, @Amount, @Revenue_Expense)";


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.AddWithValue("@ReceiptNumber", model.ReceiptNumber);
                command.Parameters.AddWithValue("@Date", model.Date);
                command.Parameters.AddWithValue("@Company", model.Company);
                command.Parameters.AddWithValue("@Amount", model.Amount);
                command.Parameters.AddWithValue("@Revenue_Expense", (int)model.Revenue_Expense);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
        }

        public void UpdateInvoice()
        {

        }

        public void DeleteInvoice()
        {

        }

        public List<ReceiptModel> GetInvoices()
        {
            string connectionString = "Data Source=localhost\\SQLExpress;Initial Catalog=Financials; Integrated Security=true";

            string queryString =
                $@" SELECT * FROM Receipt";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();//從最上方1行1行下來將SQL Sever的資料流入reader
                    List<ReceiptModel> list = new List<ReceiptModel>();

                    while (reader.Read())
                    {
                        ReceiptModel model = new ReceiptModel();
                        model.ReceiptNumber = (string)reader["ReceiptNumber"];
                        model.Date = (DateTime)reader["Date"];
                        model.Company = (string)reader["Company"];
                        model.Amount = (Decimal)reader["Amount"];
                        model.Revenue_Expense = (Revenue_Expense)reader["Revenue_Expense"];

                        list.Add(model);
                    }
                    reader.Close();

                    return list;
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
        }

        public ReceiptModel GetInvoice(string ReceiptNumber)
        {
            string connectionString = "Data Source=localhost\\SQLExpress;Initial Catalog=Financials; Integrated Security=true";

            string queryString =
                $@" SELECT * FROM Receipt
                    WHERE ReceiptNumber = @ReceiptNumber
                ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.AddWithValue("@ReceiptNumber", ReceiptNumber);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();//從最上方1行1行下來將SQL Sever的資料流入reader

                    ReceiptModel model = null;

                    while (reader.Read())
                    {   //假設有reader有讀到資料,才設定model的初始值
                        model = new ReceiptModel();
                        model.ReceiptNumber = (string)reader["ReceiptNumber"];
                        model.Date = (DateTime)reader["Date"];
                        model.Company = (string)reader["Company"];
                        model.Amount = (Decimal)reader["Amount"];
                        model.Revenue_Expense = (Revenue_Expense)reader["Revenue_Expense"];
                    }
                    reader.Close();

                    return model;
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
        }
    }
}
