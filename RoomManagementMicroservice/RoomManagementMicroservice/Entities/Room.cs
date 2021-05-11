namespace RoomManagementMicroservice.Entities
{
    public class Room
    { 
        public int Id { get; set; }
        public int RoomNumber { get; set; }
        public string RoomCategory { get; set; }
        public int PersonsNumber { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public string Facilities { get; set; }
        public string State { get; set; }
        public string Image { get; set; }
        public Room(string roomCategory, int personsNumber, string description, int price, string facilities)
        {
            RoomCategory = roomCategory;
            PersonsNumber = personsNumber;
            Description = description;
            Price = price;
            Facilities = facilities;
        }
        public Room()
        {

        }

    }
}
