using NHibernate;
using NHibernate.Criterion;
using ResponseMois.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ResponseMois.Service
{
    public abstract class AbstractService<T> where T : AbstractEntity, new()
    {
        private static IEntityManager<T> entityMng = new NHibernateEntityManager<T>();

        protected IEntityManager<T> EntityManager { get { return entityMng; } }

        public T FindById(int id)
        {
            return EntityManager.Find(new T(), id);
        }
        public T FindByIdLazy(int id)
        {
            return EntityManager.FindLazy(new T(), id);
        }


        public IList<T> GetAll(String from)
        {
            return EntityManager.GetAll(new T(), from);
        }

        public T Persist(T entity)
        {
            return EntityManager.Persist(entity);
        }

        public void Delete<T>(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                var queryString = string.Format("delete {0} where id = :id", typeof(T));
                session.CreateQuery(queryString).SetParameter("id", id).ExecuteUpdate();
            }
        }

    }
}
