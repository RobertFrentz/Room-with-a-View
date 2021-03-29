using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Data
{
    public class UsersRepository : IUsersRepository
    {
        private readonly DataContext context;

        public UsersRepository(DataContext context)
        {
            this.context = context;
        }

        public int Register(string username, string email, string password)
        {
            if(this.context.Users.Any(user => user.Username == username))
            {
                return -1;
            }
            if(this.context.Users.Any(user => user.Email == email))
            {
                return -2;
            }
            this.context.Add(new User(0, username, email, password));
            this.context.SaveChanges();
            return 1;
        }

        public int Update(User user)
        {
            if(!this.context.Users.Any(userDatabase => userDatabase.Email == user.Email))
            {
                return -1;
            }
            this.context.Update(user);
            this.context.SaveChanges();
            return 1;
        }

        public IEnumerable<User> GetAll()
        {
            return this.context.Users.ToList();
        }

        public User GetById(int id)
        {
            return this.context.Users.Find(id);
        }

        public void Remove(User user)
        {
            this.context.Remove(user);
            this.context.SaveChanges();
        }

        public int DeleteById(string email)
        {
            if(!this.context.Users.Any(user => user.Email == email))
            {
                return -1;
            }
            this.context.Remove(this.context.Users.Find(email));
            this.context.SaveChanges();
            return 1;
        }

        public bool Login(string email, string password)
        {
            var user = this.context.Users.Where(user => user.Email == email && user.Password == password).FirstOrDefault();
            if(user == null)
            {
                return false;
            }
            return true;
            
        }
    }
}
