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
                    UserId = table.Column<int>(type: "INTEGER", nullable: false),
                    RoomCategory = table.Column<string>(type: "TEXT", nullable: true),
                    CheckIn = table.Column<DateTime>(type: "TEXT", nullable: false),
                    CheckOut = table.Column<DateTime>(type: "TEXT", nullable: false),
                    PersonsNumber = table.Column<int>(type: "INTEGER", nullable: false),
                    State = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rooms", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "CheckIn", "CheckOut", "PersonsNumber", "RoomCategory", "State", "UserId" },
                values: new object[] { 1, new DateTime(2021, 4, 12, 22, 1, 8, 56, DateTimeKind.Local).AddTicks(7880), new DateTime(2021, 4, 12, 22, 1, 8, 58, DateTimeKind.Local).AddTicks(6934), 0, "Standard", "Available", 1 });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "CheckIn", "CheckOut", "PersonsNumber", "RoomCategory", "State", "UserId" },
                values: new object[] { 2, new DateTime(2021, 4, 12, 22, 1, 8, 58, DateTimeKind.Local).AddTicks(8293), new DateTime(2021, 4, 12, 22, 1, 8, 58, DateTimeKind.Local).AddTicks(8305), 3, "Standard", "Booked", 3 });

            migrationBuilder.InsertData(
                table: "Rooms",
                columns: new[] { "Id", "CheckIn", "CheckOut", "PersonsNumber", "RoomCategory", "State", "UserId" },
                values: new object[] { 3, new DateTime(2021, 4, 12, 22, 1, 8, 58, DateTimeKind.Local).AddTicks(8308), new DateTime(2021, 4, 12, 22, 1, 8, 58, DateTimeKind.Local).AddTicks(8311), 3, "Standard", "Booked", 3 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Rooms");
        }
    }
}
