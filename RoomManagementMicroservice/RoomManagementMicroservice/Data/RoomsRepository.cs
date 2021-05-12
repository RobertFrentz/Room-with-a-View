using Microsoft.EntityFrameworkCore;
using RoomManagementMicroservice.DTOs;
using RoomManagementMicroservice.Entities;
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

        public async Task<IEnumerable<RoomDescriptionDto>> GetRoomsAsync()
        {

            var rooms = await context.Rooms.Select(room =>
            new RoomDescriptionDto()
            {
                RoomCategory = room.RoomCategory,
                RoomNumber = room.RoomNumber,
                Description = room.Description,
                Facilities = room.Facilities,
                PersonsNumber = room.PersonsNumber,
                Price = room.Price,
                Image = room.Image
            }).OrderBy(room => room.Price).ToListAsync();
            return rooms;
        }

        public async Task<RoomDescriptionDto> GetRoomByNumberAsync(int roomNumber)
        {
            var room = await context.Rooms.Where(room => room.RoomNumber == roomNumber).FirstOrDefaultAsync();
            if (room == null)
            {
                return null;
            }
            RoomDescriptionDto roomDescription = new RoomDescriptionDto()
            {
                RoomCategory = room.RoomCategory,
                RoomNumber = room.RoomNumber,
                Description = room.Description,
                Facilities = room.Facilities,
                PersonsNumber = room.PersonsNumber,
                Price = room.Price,
                Image = room.Image
            };
            return roomDescription;
        }
        public async Task<int> AddRoomAsync(PostRoomDto roomToAdd)
        {
            Room room = new(roomToAdd.RoomCategory, roomToAdd.PersonsNumber, roomToAdd.Description, roomToAdd.Price, roomToAdd.Facilities);
            int numberOfRooms = context.Rooms.Count();
            room.RoomNumber = (numberOfRooms / 5 + 1) * 100 + numberOfRooms % 5;
            room.State = "Available";
            room.Image = room.RoomCategory.ToLower() + room.RoomNumber % 3 + ".jpg";
            this.context.Add(room);
            await this.context.SaveChangesAsync();
            return 1;
        }

        public async Task<int> UpdateAsync(int roomNumber,PatchRoomDto patchRoomDto)
        {
            var result = await context.Rooms.Where(room => room.RoomNumber == roomNumber).FirstOrDefaultAsync();
            if(result==null)
            {
                return -1;
            }
            result.PersonsNumber = patchRoomDto.PersonsNumber;
            result.Description = patchRoomDto.Description ?? result.Description;
            result.Price = patchRoomDto.Price;
            result.Facilities = patchRoomDto.Facilities ?? result.Facilities;
            result.State = patchRoomDto.State??result.State;
            await context.SaveChangesAsync();
            return 0;
        }
       
    }
}

