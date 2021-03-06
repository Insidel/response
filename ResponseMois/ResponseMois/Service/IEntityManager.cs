﻿using ResponseMois.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ResponseMois.Service
{
    public interface IEntityManager<T> where T : AbstractEntity
    {
       
        T Find(T entity, int id);
        T FindLazy(T entity, int id);

        T Persist(T entity);
        void Update(Book r);
        IList<T> GetAll(T entity, String fromTable);
        
    }
}
