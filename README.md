<div align="center">
  <h1>Safe Optimal Control using Log Barrier Constrained iLQR</h1>
  <p>
    <strong>Abhijeet</strong>, and <strong>Suman Chakravorty</strong>
  </p>
  <p>
    Texas A&M University, College Station, Texas, U.S.A.
  </p>
</div>

---

<div align="center">
<h2>
    <a href="Box_iLQR.pdf">Manuscript (PDF)</a>
    &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="https://github.com/abhinir/Box-iLQR/tree/main/Code/New-Code">Matlab</a>
    &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="https://github.com/abhinir/Box-iLQR-Python">Python</a>
    &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="#video-demo">Video</a>
    &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="#snapshots">Snapshots</a>
</h2>
</div>

---




## Abstract
Iterative Linear Quadratic Regulator (iLQR) and Differential Dynamic Programming (DDP) are attractive trajectory-optimization methods because their backward recursions provide both nominal trajectories and local
time-varying feedback laws. Hard state and input constraints, however, can drive solutions toward constraint boundaries where little corrective authority remains during closed-loop execution.

This paper presents \emph{Box-iLQR}, a log-barrier iLQR method for box-constrained states and controls, with emphasis on the resulting feedback policy. Barrier gradients bias nominal trajectories away from constraint boundaries, while barrier curvature enters the Riccati recursion that determines the feedback gains. We show that control-barrier curvature
smoothly attenuates feedback as an actuator approaches saturation, while state-barrier curvature propagates backward through the value function to shape feedback before future state constraints are encountered. This motivates retaining a finite barrier rather than always driving the barrier parameter toward zero, thereby preserving state and actuator margin.
Comparisons with CL-DDP and ALTRO are presented on pendulum, cart-pole, Acrobot, and car-parking problems. Monte Carlo experiments demonstrate improved closed-loop behavior with finite barriers, while a six-input MuJoCo fish example emonstrates data-driven Box-iLQR using dynamics Jacobians estimated from simulator rollouts. Box-iLQR achieves convergence comparable to, and in some cases better than, the baseline methods. Moreover, the feedback policy obtained with a finite barrier ensures constraint satisfaction even under execution uncertainty.

<!-- You can add a 'teaser' image from your paper here! -->
<!-- First, upload the image (e.g., teaser.png) to your repo just like the PDF. -->
<!-- Then, uncomment the line below and change the filename. -->
<!-- <img src="teaser.png" alt="Teaser Image" style="width:100%; max-width: 800px; display: block; margin-left: auto; margin-right: auto;"/> -->
<!-- *Fig. 1: A brief, one-sentence caption for your teaser image.* -->

---

<a name="video-demo"></a>
## Supplementary Video

<div align="center">
<div align="center">

<a href="Videos/Box_iLQR_supplementary_video_compressed_HQ.mp4">
</a>
### [▶ Watch the Box-iLQR Supplementary Video](Videos/Box_iLQR_supplementary_video_compressed_HQ.mp4)

</div>
---


<a name="video-demo"></a>
## Supplementary Video

<div align="center">

<a href="Videos/Box_iLQR_supplementary_video_compressed_HQ.mp4">
  <img src="cartpole_snapshots.png" width="800" alt="Box-iLQR Supplementary Video">
</a>

<br>

<em>Click the image to watch Box-iLQR in effect.</em>

</div>

---

---

<div align="center">
  <img src="cartpole_snapshots.png" width="800" alt="A descriptive caption for my image">
  <br>
  <em>Fig. 2: Time-lapse visualization of the cart-pole swing-up task, comparing the unconstrained trajectory (light blue) against the trajectory with both state and control constraints (red). Vertical dotted lines (--) denote the state constraint (-0.2 &lt; x<sub>1</sub> &lt; 0.2).</em>
</div>

---

<div align="center">
  <img src="acrobot_snapshots.png" width="800" alt="A descriptive caption for my image">
  <br>
  <em>Fig. 3: Time-lapse visualization of the acrobot swing-up task, comparing the unconstrained trajectory (light blue) against the trajectory with both state and control constraints (red).</em>
</div>

---

## Citation
If you use our work, please cite our paper:

<pre><code>
@misc{abhijeet2026boxilqr,
      title={Safe Optimal Control using Log Barrier Constrained iLQR}, 
      author={Abhijeet and Suman Chakravorty},
      year={2026},
      eprint={2602.05046},
      archivePrefix={arXiv},
      primaryClass={math.OC},
      url={https://arxiv.org/abs/2602.05046}, 
}
</code></pre>
