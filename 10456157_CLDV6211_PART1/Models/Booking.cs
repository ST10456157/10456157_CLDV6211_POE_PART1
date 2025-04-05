namespace _10456157_CLDV6211_PART1.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

    public class Booking
    {
    [Key]
    public int BookingId { get; set; }

    [ForeignKey("Event")]
    public int EventId { get; set; }
    public required Event Event { get; set; }

    [ForeignKey("Venue")]
    public int VenueId { get; set; }
    public required Venue Venue { get; set; }

    [Required]
    public DateTime BookingDate { get; set; }
}

