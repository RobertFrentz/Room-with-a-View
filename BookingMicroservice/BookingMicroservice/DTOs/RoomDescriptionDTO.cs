namespace BookingMicroservice.DTOs
{
    public class RoomDescriptionDto
    {
        public string? RoomCategory { get; set; }

        public int RoomNumber { get; set; }

        public string? Description { get; set; }
        public int Price { get; set; }
        public string? Facilities { get; set; }

        public int PersonsNumber { get; set; }
    }
}
