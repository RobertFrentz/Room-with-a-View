using System;
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
                    RoomCategory = table.Column<string>(type: "TEXT", nullable: true),
                    CheckIn = table.Column<DateTime>(type: "TEXT", nullable: true),
                    CheckOut = table.Column<DateTime>(type: "TEXT", nullable: true),
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
                columns: new[] { "Id", "CheckIn", "CheckOut", "Description", "Facilities", "PersonsNumber", "Price", "RoomCategory", "State" },
                values: new object[] { 1, null, null, "blabla", "Wi-Fi,Apa calda,Aer", 2, 100, "Standard", "Available" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "CheckIn", "CheckOut", "Description", "Facilities", "PersonsNumber", "Price", "RoomCategory", "State" },
                values: new object[] { 2, new DateTime(2021, 4, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2021, 4, 13, 0, 0, 0, 0, DateTimeKind.Unspecified), "blabla", "Wi-Fi,Apa calda,Aer", 3, 170, "Standard", "Booked" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "CheckIn", "CheckOut", "Description", "Facilities", "PersonsNumber", "Price", "RoomCategory", "State" },
                values: new object[] { 3, new DateTime(2021, 4, 14, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2021, 4, 16, 0, 0, 0, 0, DateTimeKind.Unspecified), "blabla", "Wi-Fi,Apa calda,Aer", 3, 130, "Standard", "Booked" });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "CheckIn", "CheckOut", "Description", "Facilities", "PersonsNumber", "Price", "RoomCategory", "State" },
                values: new object[] { 4, new DateTime(2021, 4, 6, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2021, 4, 9, 0, 0, 0, 0, DateTimeKind.Unspecified), "blabla", "Wi-Fi,Apa calda,Aer", 2, 150, "Standard", "Booked" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Rooms");
        }
    }
}
