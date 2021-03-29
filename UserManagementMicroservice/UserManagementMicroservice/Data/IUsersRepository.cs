using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UserManagementMicroservice.Entities;

namespace UserManagementMicroservice.Data
{

    public interface IUsersRepository
    {
        int Register(string username, string email, string password);
        bool Login(string email, string password);
        IEnumerable<User> GetAll();
        User GetById(int id);
        void Remove(User user);
        int Update(User user);
        int DeleteById(string id);
    }
}
