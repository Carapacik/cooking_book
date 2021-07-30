using Microsoft.EntityFrameworkCore.Migrations;

namespace RecipeBook.Api.Migrations
{
    public partial class TagsEdit : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tag_Recipe_RecipeId",
                table: "Tag");

            migrationBuilder.AlterColumn<int>(
                name: "RecipeId",
                table: "Tag",
                type: "integer",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "integer",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Tag_Recipe_RecipeId",
                table: "Tag",
                column: "RecipeId",
                principalTable: "Recipe",
                principalColumn: "RecipeId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tag_Recipe_RecipeId",
                table: "Tag");

            migrationBuilder.AlterColumn<int>(
                name: "RecipeId",
                table: "Tag",
                type: "integer",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "integer");

            migrationBuilder.AddForeignKey(
                name: "FK_Tag_Recipe_RecipeId",
                table: "Tag",
                column: "RecipeId",
                principalTable: "Recipe",
                principalColumn: "RecipeId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
