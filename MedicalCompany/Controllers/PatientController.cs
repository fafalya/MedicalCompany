using MedicalCompany.Context;
using MedicalCompany.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Timers;



namespace MedicalCompany.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PatientController : ControllerBase
    {
        private readonly MedicalDbContext _context;

        public PatientController(MedicalDbContext context)
        {
            _context = context;
        }
        // GET api/<PatientController>
        [HttpGet]
        public async Task<ActionResult<Patient>> GetPatients()
        {
            var patients = await _context.Patients.ToListAsync();
            return Ok(patients);
        }

        // GET api/<PatientController>/{name}
        [HttpGet("{name}")]
        public async Task<ActionResult<Patient>> GetPatient(string name)
        {
            string[] fullName = name.Split(' ');
            var patient = await _context.Patients.Include(p=>p.Doctor).FirstOrDefaultAsync(p => p.Surname == fullName[0] && p.Name == fullName[1] && p.SecondName == fullName[2]);
            return Ok(patient);
        }


    }
}
