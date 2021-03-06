using RoomManagementMicroservice.DTOs;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Repositories
{
    public interface IRoomsRepository
    {

        Task<IEnumerable<RoomDescriptionDto>> GetRoomsAsync();

        Task<RoomDescriptionDto> GetRoomByNumberAsync(int roomNumber);

        Task<int> AddRoomAsync(PostRoomDto roomToAdd);

        Task<int> UpdateAsync(int roomNumber,PatchRoomDto patchRoomDto);

    }
}
