using RoomManagementMicroservice.DTOs;
using RoomManagementMicroservice.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Data
{
    public interface IRoomsRepository
    {
        // Task<IEnumerable<RoomResultSearch>> GetRoomsAvailableAsync(RoomSearch roomSearch);

        Task<IEnumerable<RoomDescription>> GetRoomsAsync();

        Task<RoomDescription> GetRoomByNumberAsync(int roomNumber);

        Task<int> AddRoomAsync(RoomToAdd roomToAdd);

        //Task<Room> ModifyRoomAttributesAsync(RoomDescription room, List<RoomDescription> patchDto);
    }
}
