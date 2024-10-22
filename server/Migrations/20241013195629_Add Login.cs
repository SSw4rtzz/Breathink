using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace server.Migrations
{
    /// <inheritdoc />
    public partial class AddLogin : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "admin-user-id",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "c078d78f-4009-498f-bcb3-d26ebcc2b0a0", "AQAAAAIAAYagAAAAEGCmQrlDWg8EKmRGrs07SpYUof/jnAwgKr0afqKjBG7/zq2N4MChSERr4ncdJNaMiA==", "50a06ef8-227e-4a9d-9c1f-ead7409a975a" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "admin-user-id",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "36d3ac3b-907f-4635-8c71-48a1a6219c30", "AQAAAAIAAYagAAAAEIIj44137Ws7LSMjJq5Yb1prxUhI2ZpIn8G0yZ+5uRLoSlkYGiTiXDVhkbF8ZjedWw==", "6fb4652e-f0bb-47c8-ba62-677c39b233ac" });
        }
    }
}
