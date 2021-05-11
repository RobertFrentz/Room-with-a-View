using Microsoft.EntityFrameworkCore.Migrations;

namespace RoomManagementMicroservice.Data.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Rooms",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    RoomNumber = table.Column<int>(type: "INTEGER", nullable: false),
                    RoomCategory = table.Column<string>(type: "TEXT", nullable: true),
                    PersonsNumber = table.Column<int>(type: "INTEGER", nullable: false),
                    Description = table.Column<string>(type: "TEXT", nullable: true),
                    Price = table.Column<int>(type: "INTEGER", nullable: false),
                    Facilities = table.Column<string>(type: "TEXT", nullable: true),
                    State = table.Column<string>(type: "TEXT", nullable: true),
                    Image = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rooms", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 1, "Comfort, style and functionality are the words that can describe our standard double rooms. Hotel Iasi Royal Residence invites you to enjoy your stay in a spacious room with a QueenSize double bed and a spacious balcony where you can enjoy your morning coffee.", "Free Wi-Fi, Air Conditioning System", "standard0.jpg", 2, 150, "Standard", 100, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 2, "Comfort, style and functionality are the words that can describe our standard triple rooms. Hotel Iasi Royal Residence invites you to enjoy your stay in a spacious room with a QueenSize double bed, a single bed and a spacious balcony where you can enjoy your morning coffee.", "Free Wi-Fi, Air Conditioning System", "standard1.jpg", 3, 180, "Standard", 101, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 3, "Comfort, style and functionality are the words that can describe our standard double rooms. Hotel Iasi Royal Residence invites you to enjoy your stay in a spacious room with a QueenSize double bed and a spacious balcony where you can enjoy your morning coffee.", "Free Wi-Fi, Air Conditioning System", "standard2.jpg", 2, 150, "Standard", 102, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 4, "Comfort, style and functionality are the words that can describe our standard double rooms. Hotel Iasi Royal Residence invites you to enjoy your stay in a spacious room with a QueenSize double bed and a spacious balcony where you can enjoy your morning coffee.", "Free Wi-Fi, Air Conditioning System", "standard0.jpg", 2, 150, "Standard", 103, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 5, "Comfort, style and functionality are the words that can describe our standard triple rooms. Hotel Iasi Royal Residence invites you to enjoy your stay in a spacious room with a QueenSize double bed, a single bed and a spacious balcony where you can enjoy your morning coffee.", "Free Wi-Fi, Air Conditioning System", "standard1.jpg", 3, 180, "Standard", 104, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 6, "Deluxe Room is the answer to your expectations from our hotel room. The surface of 22 sqm with a maximum capacity of 2 people, is decorated in a minimalist style with a lot of good taste, and the room is flooded with light through the generous window it has.The stylish, non-smoking room is equipped with a queen size bed and a flat - screen TV with international channels.Bathrobes and slippers are available for added comfort.", "Free Wi-Fi, Air Conditioning System, Breakfast", "deluxe0.jpg", 2, 200, "Deluxe", 200, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 7, "Deluxe Room is the answer to your expectations from our hotel room. The surface of 22 sqm with a maximum capacity of 2 people, is decorated in a minimalist style with a lot of good taste, and the room is flooded with light through the generous window it has.The stylish, non-smoking room is equipped with a queen size bed and a flat - screen TV with international channels.Bathrobes and slippers are available for added comfort.", "Free Wi-Fi, Air Conditioning System, Breakfast", "deluxe1.jpg", 2, 200, "Deluxe", 201, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 8, "Deluxe Room is the answer to your expectations from a hotel room.The surface of 22 sqm with a maximum capacity of 3 people, is decorated in a minimalist style with a lot of good taste, and the room is flooded with light through the generous window it has.The stylish, non-smoking room is equipped with a queen size bed, single bed and a flat-screen TV with international channels.Bathrobes and slippers are available for added comfort.", "Free Wi-Fi, Air Conditioning System, Breakfast", "deluxe2.jpg", 3, 230, "Deluxe", 202, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 9, "Deluxe Room is the answer to your expectations from our hotel room. The surface of 22 sqm with a maximum capacity of 2 people, is decorated in a minimalist style with a lot of good taste, and the room is flooded with light through the generous window it has.The stylish, non-smoking room is equipped with a queen size bed and a flat - screen TV with international channels.Bathrobes and slippers are available for added comfort.", "Free Wi-Fi, Air Conditioning System, Breakfast", "deluxe0.jpg", 2, 200, "Deluxe", 203, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 10, "Deluxe Room is the answer to your expectations from a hotel room.The surface of 22 sqm with a maximum capacity of 3 people, is decorated in a minimalist style with a lot of good taste, and the room is flooded with light through the generous window it has.The stylish, non-smoking room is equipped with a queen size bed, single bed and a flat-screen TV with international channels.Bathrobes and slippers are available for added comfort.", "Free Wi-Fi, Air Conditioning System, Breakfast", "deluxe1.jpg", 3, 230, "Deluxe", 204, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 11, "Thoughtfully designed suite room.Two peaceful and spacious art deco rooms with King size four posture canopy bed &separate sitting and living room for 3 people.Offers a separate living area, private balcony overlooking the lush garden or lively town, flat screen TV with international channels and free WiFi.", "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System", "suite0.jpg", 3, 250, "Suite", 300, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 12, "Thoughtfully designed suite room.Two peaceful and spacious art deco rooms with King size four posture canopy bed &separate sitting and living room for 4 people.Offers a separate living area, private balcony overlooking the lush garden or lively town, flat screen TV with international channels and free WiFi.", "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System", "suite1.jpg", 4, 280, "Suite", 301, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 13, "Thoughtfully designed suite room.Two peaceful and spacious art deco rooms with King size four posture canopy bed &separate sitting and living room for 3 people.Offers a separate living area, private balcony overlooking the lush garden or lively town, flat screen TV with international channels and free WiFi.", "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System", "suite2.jpg", 3, 250, "Suite", 302, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 14, "Thoughtfully designed suite room.Two peaceful and spacious art deco rooms with King size four posture canopy bed &separate sitting and living room for 4 people.Offers a separate living area, private balcony overlooking the lush garden or lively town, flat screen TV with international channels and free WiFi.", "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System", "suite0.jpg", 4, 280, "Suite", 303, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "Image", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 15, "Thoughtfully designed suite room.Two peaceful and spacious art deco rooms with King size four posture canopy bed &separate sitting and living room for 3 people.Offers a separate living area, private balcony overlooking the lush garden or lively town, flat screen TV with international channels and free WiFi.", "Free Wi-Fi, Air Conditioning System, Breakfast, Safe System", "suite1.jpg", 3, 250, "Suite", 304, "Available" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Rooms");
        }
    }
}
