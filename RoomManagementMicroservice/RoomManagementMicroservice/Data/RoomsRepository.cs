using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.DTOs;
using RoomManagementMicroservice.Utils;
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

        public async Task<IEnumerable<RoomResultSearch>> GetRoomsAvailableAsync(RoomSearch roomSearch)
        {
            var rooms = await context.Rooms.Where(room => room.RoomCategory == roomSearch.RoomCategory && (room.CheckIn == null
              || (room.CheckIn < roomSearch.CheckIn && room.CheckOut< roomSearch.CheckIn) 
              || (room.CheckIn > roomSearch.CheckOut && room.CheckOut> roomSearch.CheckOut))
              && room.PersonsNumber==roomSearch.PersonsNumber).Select(room=>
              new RoomResultSearch()
              {
                  RoomCategory=room.RoomCategory,
                  Id=room.Id,
                  Price=room.Price
              }).ToListAsync();
            return rooms;
        }

        public async Task<IEnumerable<RoomResultSearch>> GetRoomsAsync()
        {
            var rnd = (new Random()).Next(100);
            var rooms = await context.Rooms.Select(room =>
            new RoomResultSearch()
            {
                RoomCategory = room.RoomCategory,
                Id = room.Id,
                Price = room.Price
            }).OrderBy(room => room.Price * rnd).Take(10).ToListAsync();
            return rooms;
        }

        public async Task<RoomDescription> GetRoomByIdAsync(int id)
        {
            var room = await context.Rooms.FindAsync(id);
            RoomDescription roomDescription = new RoomDescription()
            {
                RoomCategory = room.RoomCategory,
                Description = room.Description,
                Facilities = room.Facilities,
                PersonsNumber = room.PersonsNumber,
                Price = room.Price
            };
            return roomDescription;
        }
    }
}
