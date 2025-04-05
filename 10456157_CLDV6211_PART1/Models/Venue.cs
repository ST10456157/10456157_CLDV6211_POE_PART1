namespace _10456157_CLDV6211_PART1.Models;
using System.ComponentModel.DataAnnotations;

    public class Venue
    {
    [Key]
    public int VenueId { get; set; }

    [Required]
    public required string VenueName { get; set; }

    [Required]
    public required string Location { get; set; }

    [Required]
    public int Capacity { get; set; }

    public required string ImageUrl { get; set; }
}

