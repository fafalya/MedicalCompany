using System;
using System.Collections.Generic;

namespace MedicalCompany.Models;

public partial class Patient
{
    public int Id { get; set; }

    public string Surname { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string SecondName { get; set; } = null!;

    public string? Gender { get; set; }

    public int? DoctorId { get; set; }

    public virtual Doctor? Doctor { get; set; }
}
