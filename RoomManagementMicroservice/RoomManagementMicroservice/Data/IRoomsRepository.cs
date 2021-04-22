using RoomManagementMicroservice.DTOs;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Data
{
    public interface IRoomsRepository
    {

        Task<IEnumerable<RoomDescriptionDto>> GetRoomsAsync();

        Task<RoomDescriptionDto> GetRoomByNumberAsync(int roomNumber);

        Task<int> AddRoomAsync(RoomToAddDto roomToAdd);

        //Task<Room> ModifyRoomAttributesAsync(RoomDescription room, List<RoomDescription> patchDto);
    }
}
