using RoomManagementMicroservice.DTOs;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Data
{
    public interface IRoomsRepository
    {
        // Task<IEnumerable<RoomResultSearch>> GetRoomsAvailableAsync(RoomSearch roomSearch);

        Task<IEnumerable<RoomDescription>> GetRoomsAsync();

        Task<RoomDescription> GetRoomByNumberAsync(int roomNumber);
    }
}
