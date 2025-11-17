import React, { useState } from 'react'

export default function TaskForm({ onAdd }) {
  const [title, setTitle] = useState('')
  const [dueDate, setDueDate] = useState('')

  const submit = async (e) => {
    e.preventDefault()
    if (!title.trim()) return
    const data = { title: title.trim(), dueDate: dueDate ? new Date(dueDate).toISOString() : null, status: 'Đang làm' }
    try {
      await onAdd(data)
      setTitle('')
      setDueDate('')
    } catch (err) {
      // onAdd shows alert and logs; keep inputs so user can retry
      console.error('Add failed', err)
    }
  }

  return (
    <form className="task-form" onSubmit={submit}>
      <input className="task-input" value={title} onChange={e => setTitle(e.target.value)} placeholder="Task name" />
      <input className="task-date" type="date" value={dueDate} onChange={e => setDueDate(e.target.value)} />
      <button className="task-add" type="submit">Add</button>
    </form>
  )
}
