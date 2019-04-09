using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

    public static class WebCom
    {
        public static string GetJson(string Url)
        {
            string json = "";
            try
            {
                WebRequest request = WebRequest.Create(Url);
                WebResponse response = request.GetResponse();


                Stream stream = response.GetResponseStream();
                StreamReader reader = new StreamReader(stream);

                json = reader.ReadToEnd();
                reader.Close();
                response.Close();

                return json;
            }
            catch (Exception ex)
            {
                json = "An error has occured retrieving data from the Web API.";
            }

            return json;
        }

        public static string PushPOST(string Url, Object obj)
        {

            JavaScriptSerializer ser = new JavaScriptSerializer();
            string json = ser.Serialize(obj);
            try
            {
                WebRequest request = WebRequest.Create(Url);
                request.Method = "POST";
                request.ContentLength = json.Length;
                request.ContentType = "application/json";


                StreamWriter sw = new StreamWriter(request.GetRequestStream());
                sw.Write(json);
                sw.Flush();
                sw.Close();

                WebResponse response = request.GetResponse();
                Stream stream = response.GetResponseStream();
                StreamReader reader = new StreamReader(stream);
                String data = reader.ReadToEnd();

                reader.Close();
                response.Close();

                if (data == "\"City added successful!\"")
                {
                    return data;
                }
                else
                {
                    return data;
                }
            }
            catch (Exception ex)
            {
                return "An error occured";
            }
        }
    }
