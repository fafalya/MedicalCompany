import React, { useState } from 'react';
import { Button,Container,InputGroup, Form , Table} from 'react-bootstrap';
import axios from 'axios';
import './App.css';


function App() {
  const [name, setName] = useState();
  const [patient, setPatient]=useState();

  async function FindPatient () {
    if (name !==null)
    await GetPatient(name);
  } 
  async function GetPatient(name) {
    try {
      const result = await axios.get('http://localhost:5162/api/Patient/'+name);
      setPatient(result.data);
    } catch(error){
      console.log(error);}
  }
  const TableRes =()=>{
    if (patient!==undefined){
    return (
            <tr>
              <th>{patient.id}</th>
              <th>{patient.doctor.surname}</th>
              <th>{patient.doctor.name}</th>
              <th>{patient.doctor.secondName}</th>
              <th>{patient.doctor.gender}</th>
              <th>{patient.doctor.speciality}</th>
              <th>{patient.doctor.room}</th>
            </tr> 
    )
    }
  }
  
  return (
    <div className="App">
      <Container >
        <InputGroup className="mb-3">
          <Form.Control
            placeholder="Введите ФИО пациента"
            aria-describedby="basic-addon2"
            value={name}
            onChange={event => setName(event.target.value)}
          />
          <Button variant="outline-secondary" id="button-addon2"
          onClick={FindPatient}
          >
            Найти
          </Button>
        </InputGroup>
        <Table striped bordered hover>
          <thead>
            <tr>
              <th>#</th>
              <th>Фамилия врача</th>
              <th>Имя врача</th>
              <th>Отчество врача</th>
              <th>Пол врача</th>
              <th>Специальность врача</th>
              <th>Кабинет врача</th>
            </tr>
          </thead>
          <tbody>
            <TableRes/> 
          </tbody>
        </Table>
      </Container>
    </div>

  );
}

export default App;
