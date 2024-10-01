using Microsoft.AspNetCore.Identity;

namespace server.Models {
    public class ApplicationUser : IdentityUser {
        public required string Nick { get; set; }
        public required ICollection<Bookshelf> Bookshelves { get; set; }
    }
}
