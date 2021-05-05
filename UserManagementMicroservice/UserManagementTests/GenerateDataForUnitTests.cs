using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UserManagementMicroservice.DTOs;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;

namespace UserManagementTests
{
    class GenerateDataForUnitTests :IEnumerable<object[]>
    {
        public static User GetTestUser(int i)
        {
            if (i == 1)
            {
                return new User()
                {
                    Id = 1,
                    Username = "Test One",
                    Password = Cryptography.HashString("123"),
                    Email = Cryptography.HashString("has@gmail.com"),
                    Role = 0
                };
            }
            else if(i==2)
            {
                return new User()
                {
                    Id = 2,
                    Username = "Test Two",
                    Password = Cryptography.HashString("123"),
                    Email = Cryptography.HashString("mist@gmail.com"),
                    Role = 1
                };
            }
            else
            {
                return new User()
                {
                    Id = 3,
                    Username = "Test Three",
                    Password = Cryptography.HashString("123"),
                    Email = Cryptography.HashString("fos@gmail.com"),
                    Role = 2
                };
            }
        }
        public IEnumerator<object[]> GetEnumerator()
        {
            yield return new object[] {
                new UserRegisterDto{

                    Username="gigelus",
                    Email= "has@gmail.com",
                    Password="gigel"
                },
                0
            };
            yield return new object[] {
                new UserRegisterDto
                {
                    Username = "Test Two",
                    Email = "costelus@gmail.com",
                    Password = "costel"
                },
                1
            };
            yield return new object[] {
                new UserRegisterDto
                {
                    Username = "Test Three",
                    Email = "marcelus@gmail.com",
                    Password = "marcel"
                },
                2
            };
        }

        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
    }
}
