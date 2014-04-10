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

        public T FindById(long id)
        {
            return EntityManager.Find(new T(), id);
        }

        public IList<T> GetAll(String from)
        {
            return EntityManager.GetAll(new T(), from);
        }

        public T Persist(T entity)
        {
            return EntityManager.Persist(entity);
        }
    }
}
