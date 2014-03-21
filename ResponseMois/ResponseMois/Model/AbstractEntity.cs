using ResponseMois.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ResponseMois.Model
{
    /// <summary>
    /// Abstract representation of persistence entity
    /// </summary>
    public class AbstractEntity : IAbstractEntity
    {
        /// <summary>
        /// Primary key
        /// </summary>
        public virtual long? ID
        {
            get;
            set;
        }
    }


}
