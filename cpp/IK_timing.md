CPU: AMD Ryzen 5 5625U with Radeon Graphics @ 2.3 GHz

OS:  Ubuntu 22.04.3 LTS

| Ik                              | Batched Time (ns) |
| :------------------------------ | ----------------: |
| Spherical                       |              1714 |
| Spherical Two Intersecting      |              2171 |
| Spherical Two Parallel          |              2707 |
| Three Parallel                  |              1943 |
| Three Parallel Two Intersecting |              2559 |
| Two Parallel                    |            222512 |
| Two Intersecting                |            277708 |
| Gen Six DOF                     |           8406408 |

| Ik               | Batched Time (ns) |
| :--------------- | ----------------: |
| IK R 2R R 3R SJ2 |            169364 |

| Hardcoded Ik     | Batched Time (ns) |
| :--------------- | ----------------: |
| Motoman 50 SJ2   |            235941 |