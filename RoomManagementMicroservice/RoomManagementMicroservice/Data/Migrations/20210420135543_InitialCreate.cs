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
                    State = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rooms", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 1, "blabla", "Free Wi-Fi", 2, 100, "Standard", 100, "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 2, "blabla", "Free Wi-Fi", 3, 170, "Standard", 101, "Booked" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 3, "blabla", "Free Wi-Fi", 3, 130, "Standard", 102, "Booked" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "Description", "Facilities", "PersonsNumber", "Price", "RoomCategory", "RoomNumber", "State" },
                values: new object[] { 4, "blabla", "Free Wi-Fi", 2, 150, "Standard", 103, "Booked" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Rooms");
        }
    }
}
