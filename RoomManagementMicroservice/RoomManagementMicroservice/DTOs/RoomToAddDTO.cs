namespace RoomManagementMicroservice.DTOs
{
    public class RoomToAddDto
    {
        public string RoomCategory { get; set; }
        public int PersonsNumber { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public string Facilities { get; set; }
    }
}
