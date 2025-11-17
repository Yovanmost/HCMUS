import React, { useState } from 'react'

function formatDate(d) {
  if (!d) return ''
  const dt = new Date(d)
  return dt.toLocaleDateString()
}

// Convert an ISO date/time (or null) to a value suitable for <input type="date" />
function isoToInputDate(iso) {
  if (!iso) return ''
  const d = new Date(iso)
  const yyyy = d.getFullYear()
  const mm = String(d.getMonth() + 1).padStart(2, '0')
  const dd = String(d.getDate()).padStart(2, '0')
  return `${yyyy}-${mm}-${dd}`
}

export default function TaskList({ tasks, onDelete, onUpdate }) {
  const [editingId, setEditingId] = useState(null)
  const [editTitle, setEditTitle] = useState('')
  const [editDue, setEditDue] = useState('')
  const [editStatus, setEditStatus] = useState('')

  const startEdit = (t) => {
    setEditingId(t.id)
    setEditTitle(t.title)
    // Use local date parts to avoid timezone shifts when showing in the date input
    setEditDue(isoToInputDate(t.dueDate))
    setEditStatus(t.status)
  }

  const save = (id) => {
    onUpdate(id, { title: editTitle, dueDate: editDue ? new Date(editDue).toISOString() : null, status: editStatus })
    setEditingId(null)
  }

  return (
    <table className="task-table">
      <thead>
        <tr><th>Task</th><th>Due-date</th><th>Status</th><th>Actions</th></tr>
      </thead>
      <tbody>
        {tasks.map(t => (
          <tr key={t.id}>
            <td>
              {editingId === t.id ? (
                <input value={editTitle} onChange={e => setEditTitle(e.target.value)} />
              ) : (
                t.title
              )}
            </td>
            <td>{editingId === t.id ? (
              <input type="date" value={editDue} onChange={e => setEditDue(e.target.value)} />
            ) : (
              formatDate(t.dueDate)
            )}</td>
            <td>{editingId === t.id ? (
              <select value={editStatus} onChange={e => setEditStatus(e.target.value)}>
                <option>Đang làm</option>
                <option>Hoàn thành</option>
              </select>
            ) : (
              t.status
            )}</td>
            <td>
              {editingId === t.id ? (
                <>
                  <button onClick={() => save(t.id)}>Save</button>
                  <button onClick={() => setEditingId(null)}>Cancel</button>
                </>
              ) : (
                <>
                  <button onClick={() => startEdit(t)}>✏️</button>
                  <button onClick={() => onDelete(t.id)}>🗑️</button>
                  {t.status !== 'Hoàn thành' && (
                    <button onClick={() => onUpdate(t.id, { title: t.title, dueDate: t.dueDate, status: 'Hoàn thành' })} title="Mark as complete">✅</button>
                  )}
                </>
              )}
            </td>
          </tr>
        ))}
      </tbody>
    </table>
  )
}
