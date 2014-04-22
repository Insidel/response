using ResponseMois.Model;
using NHibernate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ResponseMois.Service
{
    class NHibernateEntityManager<T> : IEntityManager<T> where T : AbstractEntity, new()
    {
        
        public void Update(Book r)
        {

        }
        
        public T Find(T entity, int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                var fromDb = session.Get<T>(id);

                return fromDb as T;
            }
        }
        
        public T FindLazy(T entity, int id)
        {
            ISession session = NHibernateHelper.OpenSession();
            var fromDb = session.Get<T>(id);

            return fromDb as T;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="entity">entity to return</param>
        /// <param name="tableFrom">from table</param>
        /// <returns></returns>
        public IList<T> GetAll(T entity, String tableFrom)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                IQuery query = session.CreateQuery(tableFrom);
                var entities = query.List<T>();
                return entities;
            }

        }

        public T Persist(T entity)
        {
            if (entity.ID == null)
            {
                using (ISession session = NHibernateHelper.OpenSession())
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                }
            }
            return null;
        }
    }
}
