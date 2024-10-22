using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace server.Models {
    public class Bookshelf {
        public required int Id { get; set; }

        /// <summary>
        /// FK para o utilizador
        /// </summary>
        public required string UserId { get; set; }

        /// <summary>
        /// FK para o livro
        /// </summary>
        public required int BookId { get; set; }

        /// <summary>
        /// FK para o estado do livro na estante
        /// </summary>
        [Required(ErrorMessage = "{0} is mandatory")]
        [ForeignKey(nameof(State))]
        public int StateFK { get; set; }
        public required State State { get; set; }

        /// <summary>
        /// Classificação dada pelo utilizador (1-5 estrelas)
        /// </summary>
        public int? Rating { get; set; }
        /// <summary>
        /// // Data em que o livro foi lido
        /// </summary>
        [Display(Name = "Reading Date")]
        public DateTime? DateRead { get; set; }

        // Relacionamentos
        public required ApplicationUser User { get; set; }
        public required Book Book { get; set; }
    }
}
