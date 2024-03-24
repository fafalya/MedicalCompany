using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace MedicalCompany.Models;

public partial class Doctor
{
    public int Id { get; set; }

    public string Surname { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string SecondName { get; set; } = null!;

    public string? Gender { get; set; }

    public string Speciality { get; set; } = null!;

    public int Room { get; set; }
    [JsonIgnore]
    public virtual ICollection<Patient> Patients { get; set; } = new List<Patient>();
}
