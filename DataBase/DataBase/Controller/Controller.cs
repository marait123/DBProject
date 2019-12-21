using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBProject
{
    public class Controller
    {
        DBManager dbMan;
        public Controller()
        {
            dbMan = new DBManager();
        }

      
        public void TerminateConnection()
        {
            dbMan.CloseConnection();
        }



        public DataTable getNumOfKids(string day)
        {
            String StoredProcedureName = StoredProcedures.getKidOnDay;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@Day", day);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        public DataTable getFees(string day, string KidName)
        {
            String StoredProcedureName = StoredProcedures.getfees;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@kidName", KidName);
            Parameters.Add("@Day", day);

            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }


        public DataTable getNamesHours(string SubjectName)
        {
            String StoredProcedureName = StoredProcedures.subjectHour;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@subName", SubjectName);
            return dbMan.ExecuteReader(StoredProcedureName, Parameters);
        }
        /*
        public DataTable SelectAllEmp()
        {

            string StoredProcedureName = StoredProcedures.SelectAllEmployees;
            return dbMan.ExecuteReader(StoredProcedureName, null);
        }


        public int InsertProject(string Pname, int pnumber, string Plocation, int Dnum)
        {

            string StoredProcedureName = StoredProcedures.InsertProject;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@Pname", Pname);
            Parameters.Add("@Pnumber", pnumber);
            Parameters.Add("@Plocation", Plocation);
            Parameters.Add("@Dnum", Dnum);
            return dbMan.ExecuteNonQuery(StoredProcedureName,Parameters);
        }

        public DataTable SelectDepNum()
        {
            string StoredProcedureName = StoredProcedures.SelectDepartmentNum;
            return dbMan.ExecuteReader(StoredProcedureName, null);

        }
        public DataTable SelectDepLoc()
        {
            String StoredProcedureName = StoredProcedures.SelectDepartmentLocation;
            return dbMan.ExecuteReader(StoredProcedureName, null);

        }

        public DataTable SelectProject(string location)
        {
            String StoredProcedureName = StoredProcedures.RetrieveProject;
            Dictionary<string, object> Parameters = new Dictionary<string, object>();
            Parameters.Add("@location", location);
           return dbMan.ExecuteReader(StoredProcedureName,Parameters);
        }*/

    }
}
