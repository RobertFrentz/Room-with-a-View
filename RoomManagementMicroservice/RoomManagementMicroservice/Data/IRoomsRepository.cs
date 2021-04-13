using RoomManagementMicroservice.Entities;
using RoomManagementMicroservice.Utils;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RoomManagementMicroservice.Data
{
    public interface IRoomsRepository
    {
        Task<IEnumerable<RoomSearch>> GetRoomsAvailableAsync(RoomSearch roomSearch);

        Task<IEnumerable<RoomDescription>> GetRoomsAsync();
    }
}
