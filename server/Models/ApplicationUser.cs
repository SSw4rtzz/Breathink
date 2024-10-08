using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace server.Models {
    public class ApplicationUser : IdentityUser {
        [Required(ErrorMessage = "{0} is mandatory")]
        public required string Nick { get; set; }
        public required ICollection<Bookshelf> Bookshelves { get; set; }
    }
}
