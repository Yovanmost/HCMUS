import React, { useEffect, useState } from 'react'
import api from './api'
import TaskForm from './components/TaskForm'
import TaskList from './components/TaskList'

export default function App() {
  const [tasks, setTasks] = useState([])
  const [filter, setFilter] = useState('')

  const load = async (status = '') => {
    const params = status ? `?status=${encodeURIComponent(status)}` : ''
    const res = await api.get(`/tasks${params}`)
    setTasks(res.data)
  }

  useEffect(() => { load(filter) }, [filter])

  const add = async (item) => {
    try {
      await api.post('/tasks', item)
      load(filter)
    } catch (err) {
      console.error('Failed to add task', err)
      alert('Failed to add task - check console for details')
    }
  }

  const remove = async (id) => {
    await api.delete(`/tasks/${id}`)
    load(filter)
  }

  const update = async (id, item) => {
    await api.put(`/tasks/${id}`, item)
    load(filter)
  }

  return (
    <div className="container">
      <div className="card">
        <h1>Personal Task Manager</h1>

        <TaskForm onAdd={add} />

        <div className="filter">
          <label>Filter:</label>
          <select value={filter} onChange={e => setFilter(e.target.value)}>
            <option value="">Tất cả</option>
            <option value="Đang làm">Đang làm</option>
            <option value="Hoàn thành">Hoàn thành</option>
          </select>
        </div>

        <TaskList tasks={tasks} onDelete={remove} onUpdate={update} />
      </div>
    </div>
  )
}
