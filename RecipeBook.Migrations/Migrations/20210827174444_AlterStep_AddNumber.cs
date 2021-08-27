using Microsoft.EntityFrameworkCore.Migrations;

namespace RecipeBook.Migrations.Migrations
{
    public partial class AlterStep_AddNumber : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Number",
                table: "Step",
                type: "integer",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Number",
                table: "Step");
        }
    }
}
