using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace server.Models {
    public class Bookshelf {
        public required int Id { get; set; }  // PK
        public required string UserId { get; set; }  // FK utilizador
        public required int BookId { get; set; }  // FK livro

        /// <summary>
        /// FK para o estado do livro na estante
        /// </summary>
        [Required(ErrorMessage = "O {0} é de preenchimento obrigatório")]
        [ForeignKey(nameof(State))]
        public int StateFK { get; set; }
        public required State State { get; set; }

        public int? Rating { get; set; }  // Classificação dada pelo utilizador (1-5 estrelas)
        public DateTime? DateRead { get; set; }  // Data em que o livro foi lido

        // Relacionamentos
        public required ApplicationUser User { get; set; }
        public required Book Book { get; set; }
    }
}
