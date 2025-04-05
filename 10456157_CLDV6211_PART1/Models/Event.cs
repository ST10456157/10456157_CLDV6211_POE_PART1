namespace _10456157_CLDV6211_PART1.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

    public class Event
    {
    [Key]
    public int EventId { get; set; }

    [Required]
    public required string EventName { get; set; }

    [Required]
    public DateTime EventDate { get; set; }

    public required string Description { get; set; }

    [ForeignKey("Venue")]
    public int? VenueId { get; set; }
    public Venue? Venue { get; set; }
}

