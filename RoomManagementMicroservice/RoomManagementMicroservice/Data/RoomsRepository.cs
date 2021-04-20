using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.DTOs;
using RoomManagementMicroservice.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Data
{
    public class RoomsRepository : IRoomsRepository
    {
        private readonly DataContext context;

        public RoomsRepository(DataContext context)
        {
            this.context = context;
        }

       /* public async Task<IEnumerable<RoomResultSearch>> GetRoomsAvailableAsync(RoomSearch roomSearch)
        {
            var rooms = await context.Rooms.Where(room => room.RoomCategory == roomSearch.RoomCategory && (room.CheckIn == null
              || (room.CheckIn < roomSearch.CheckIn && room.CheckOut< roomSearch.CheckIn) 
              || (room.CheckIn > roomSearch.CheckOut && room.CheckOut> roomSearch.CheckOut))
              && (roomSearch.CheckIn<roomSearch.CheckOut) && room.PersonsNumber==roomSearch.PersonsNumber).Select(room=>
              new RoomResultSearch()
              {
                  RoomCategory=room.RoomCategory,
                  Id=room.Id,
                  Price=room.Price
              }).ToListAsync();
            return rooms;
        }
*/
        public async Task<IEnumerable<RoomDescriptionDTO>> GetRoomsAsync()
        {
            var rnd = (new Random()).Next(100);
            var rooms = await context.Rooms.Select(room =>
            new RoomDescriptionDTO()
            {
                RoomCategory = room.RoomCategory,
                RoomNumber = room.RoomNumber,
                Description = room.Description,
                Facilities = room.Facilities,
                PersonsNumber = room.PersonsNumber,
                Price = room.Price
            }).OrderBy(room => room.Price * rnd).Take(10).ToListAsync();
            return rooms;
        }

        public async Task<RoomDescriptionDTO> GetRoomByNumberAsync(int roomNumber)
        {
            var room = await context.Rooms.Where(room => room.RoomNumber == roomNumber).FirstOrDefaultAsync();
            if (room == null)
            {
                return null;
            }
            RoomDescriptionDTO roomDescription = new RoomDescriptionDTO()
            {
                RoomCategory = room.RoomCategory,
                RoomNumber = room.RoomNumber,
                Description = room.Description,
                Facilities = room.Facilities,
                PersonsNumber = room.PersonsNumber,
                Price = room.Price
            };
            return roomDescription;
        }
        //formula generare room number (nr.camerere / 10) + 1 * 100 + nr.camere % 10
        public async Task<int> AddRoomAsync(RoomToAdd roomToAdd)
        {
            Room room = new Room(roomToAdd.RoomCategory, roomToAdd.PersonsNumber, roomToAdd.Description, roomToAdd.Price, roomToAdd.Facilities);
            int numberOfRooms = context.Rooms.Count();
            room.RoomNumber = (numberOfRooms / 10 + 1) * 100 + numberOfRooms % 10;
            room.State = "Available";

            this.context.Add(room);
            await this.context.SaveChangesAsync();
            return 1;
        }

       /* public async Task<Room> ModifyRoomAttributesAsync(int roomNumber, RoomToAdd roomToAdd)
        {
            var result = await context.Rooms.FirstOrDefaultAsync(room => room.RoomNumber == roomNumber);
            return result;
        }*/
    }
}
