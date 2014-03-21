using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;

namespace ResponseMois.Design
{
    public class TableSchemaGenerator
    {
        /// <summary>
        /// Vygenerovani DB schema podle entit
        /// </summary>
        public void Generate()
        {
            var cfg = new Configuration();

            cfg.Configure();

            cfg.AddAssembly(typeof(TableSchemaGenerator).Assembly);

            SchemaExport schemaExport = new SchemaExport(cfg);
            schemaExport.Drop(false, true);
            schemaExport.Execute(false, true, false);
        }
    }
}