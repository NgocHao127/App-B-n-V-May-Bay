using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AppBanVeMayBay
{
    internal class DataProvider
    {
        public static string connectionString = @"Data Source=MAYTINH-VC21J73\SQLEXPRESS;Initial Catalog=QLMayBay;Integrated Security=True;";
        public static SqlConnection conn;
        private SqlDataAdapter adapter;
        private SqlCommand command;
        //kết nối vs csdl
        public void connect()
        {
            conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Không kết nối được CSDL", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        //đóng kết nối
        public void disconnect()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
        //thực thi một truy vấn SQL và trả về kết quả dưới dạng DataTable
        public DataTable executeQuery(string sqlString)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            adapter = new SqlDataAdapter(sqlString, conn);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            disconnect();
            return ds.Tables[0];
        }
        //thực thi một truy vấn SQL không trả về kết quả, ví dụ như INSERT, UPDATE hoặc DELETE
        public void executeNonQuery(string sqlString)
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            command = new SqlCommand(sqlString, conn);
            command.ExecuteNonQuery();
            disconnect();
        }
        //thực thi một truy vấn SQL và trả về giá trị đơn (scalar) duy nhất
        public object executeScalar(string sqlString)
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            command = new SqlCommand(sqlString, conn);
            disconnect();
            return command.ExecuteScalar();
        }
    }
}
