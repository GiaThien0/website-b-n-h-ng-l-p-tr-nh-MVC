using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using System.Security.Cryptography;
using System.Text;

namespace WebApplication1.Models
{
    public class Mahoa
    {
        public static String encryptSHA256(String PlainText)
        {
            string result = "123456";
            using (SHA256 bb = SHA256.Create())
            {
                byte[] sourceData = Encoding.UTF8.GetBytes(PlainText);
                byte[] hashResult = bb.ComputeHash(sourceData);
                result = BitConverter.ToString(hashResult);

            }
            return result;
        }
    }
}