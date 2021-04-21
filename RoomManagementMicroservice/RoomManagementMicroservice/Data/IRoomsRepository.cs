using RoomManagementMicroservice.DTOs;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Data
{
    public interface IRoomsRepository
    {
        // Task<IEnumerable<RoomResultSearch>> GetRoomsAvailableAsync(RoomSearch roomSearch);

        Task<IEnumerable<RoomDescriptionDTO>> GetRoomsAsync();

        Task<RoomDescriptionDTO> GetRoomByNumberAsync(int roomNumber);

        Task<int> AddRoomAsync(RoomToAddDTO roomToAdd);

        //Task<Room> ModifyRoomAttributesAsync(RoomDescription room, List<RoomDescription> patchDto);
    }
}
